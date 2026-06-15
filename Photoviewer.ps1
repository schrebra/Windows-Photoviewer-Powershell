Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# ──────────────────────────────────────────────
#  Debug log
# ──────────────────────────────────────────────
$script:debugLogs = New-Object System.Collections.Generic.List[string]
function Add-Log($msg) {
    $e = "$(Get-Date -Format 'HH:mm:ss') - $msg"
    $script:debugLogs.Add($e)
    Write-Host $e
}

# ──────────────────────────────────────────────
#  XAML  –  Dark Aero Glass theme
# ──────────────────────────────────────────────
$xamlString = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Windows Photo Viewer" Height="680" Width="960"
        WindowStartupLocation="CenterScreen"
        Background="#FF141820"
        FontFamily="Segoe UI" FontSize="12">

  <Window.Resources>

    <LinearGradientBrush x:Key="PillNormal" StartPoint="0,0" EndPoint="0,1">
      <GradientStop Color="#FF3A5070" Offset="0"/>
      <GradientStop Color="#FF243A58" Offset="0.49"/>
      <GradientStop Color="#FF182E48" Offset="0.51"/>
      <GradientStop Color="#FF1E3850" Offset="1"/>
    </LinearGradientBrush>

    <LinearGradientBrush x:Key="PillHover" StartPoint="0,0" EndPoint="0,1">
      <GradientStop Color="#FF4E6E94" Offset="0"/>
      <GradientStop Color="#FF335878" Offset="0.49"/>
      <GradientStop Color="#FF244268" Offset="0.51"/>
      <GradientStop Color="#FF2E5278" Offset="1"/>
    </LinearGradientBrush>

    <LinearGradientBrush x:Key="PillPressed" StartPoint="0,0" EndPoint="0,1">
      <GradientStop Color="#FF1A3050" Offset="0"/>
      <GradientStop Color="#FF243C5C" Offset="1"/>
    </LinearGradientBrush>

    <Style x:Key="NavPillBtn" TargetType="Button">
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Height" Value="34"/>
      <Setter Property="Width"  Value="48"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Grid>
              <Border x:Name="bd" CornerRadius="5" BorderThickness="1"
                      BorderBrush="#FF4A6A90"
                      Background="{StaticResource PillNormal}"/>
              <Border Height="16" VerticalAlignment="Top" Margin="1,1,1,0"
                      CornerRadius="4,4,1,1" IsHitTestVisible="False">
                <Border.Background>
                  <LinearGradientBrush StartPoint="0,0" EndPoint="0,1">
                    <GradientStop Color="#44FFFFFF" Offset="0"/>
                    <GradientStop Color="#00FFFFFF" Offset="1"/>
                  </LinearGradientBrush>
                </Border.Background>
              </Border>
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Grid>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="bd" Property="Background" Value="{StaticResource PillHover}"/>
                <Setter TargetName="bd" Property="BorderBrush" Value="#FF6A9AC0"/>
              </Trigger>
              <Trigger Property="IsPressed" Value="True">
                <Setter TargetName="bd" Property="Background" Value="{StaticResource PillPressed}"/>
              </Trigger>
              <Trigger Property="IsEnabled" Value="False">
                <Setter TargetName="bd" Property="Opacity" Value="0.35"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style x:Key="OrbBtn" TargetType="Button">
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Width"  Value="52"/>
      <Setter Property="Height" Value="52"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Grid Width="52" Height="52">
              <Ellipse Margin="-6">
                <Ellipse.Fill>
                  <SolidColorBrush Color="#5000AAFF"/>
                </Ellipse.Fill>
                <Ellipse.Effect>
                  <BlurEffect Radius="10"/>
                </Ellipse.Effect>
              </Ellipse>
              <Ellipse Fill="#AA000000" Margin="2,4,2,-2">
                <Ellipse.Effect>
                  <BlurEffect Radius="5"/>
                </Ellipse.Effect>
              </Ellipse>
              <Ellipse>
                <Ellipse.Fill>
                  <LinearGradientBrush StartPoint="0,0" EndPoint="0,1">
                    <GradientStop Color="#FF8899AA" Offset="0"/>
                    <GradientStop Color="#FF3A4A5A" Offset="1"/>
                  </LinearGradientBrush>
                </Ellipse.Fill>
              </Ellipse>
              <Ellipse Margin="3" Fill="#FF05101A"/>
              <Ellipse x:Name="orbBody" Margin="4">
                <Ellipse.Fill>
                  <RadialGradientBrush GradientOrigin="0.5,1.05" Center="0.5,1.05"
                                       RadiusX="0.85" RadiusY="0.9">
                    <GradientStop Color="#FF60B8FF" Offset="0"/>
                    <GradientStop Color="#FF1870D0" Offset="0.5"/>
                    <GradientStop Color="#FF083880" Offset="1"/>
                  </RadialGradientBrush>
                </Ellipse.Fill>
              </Ellipse>
              <Path Margin="5,4,5,0" Stretch="Fill" Height="24" VerticalAlignment="Top"
                    Data="M 0,16 C 8,1 44,1 52,16 C 44,25 8,25 0,16 Z">
                <Path.Fill>
                  <LinearGradientBrush StartPoint="0.5,0" EndPoint="0.5,1">
                    <GradientStop Color="#DDFFFFFF" Offset="0"/>
                    <GradientStop Color="#44FFFFFF"  Offset="0.55"/>
                    <GradientStop Color="#00FFFFFF"  Offset="1"/>
                  </LinearGradientBrush>
                </Path.Fill>
              </Path>
              <Canvas Width="52" Height="52">
                <Path Fill="#EEFFFFFF" Canvas.Left="20" Canvas.Top="17"
                      Data="M 0,0 L 16,9 L 0,18 Z"/>
              </Canvas>
            </Grid>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="orbBody" Property="Opacity" Value="0.88"/>
              </Trigger>
              <Trigger Property="IsPressed" Value="True">
                <Setter TargetName="orbBody" Property="Opacity" Value="0.7"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style x:Key="ToolBtn" TargetType="Button">
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Width"  Value="34"/>
      <Setter Property="Height" Value="34"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="bd" CornerRadius="4" BorderThickness="1"
                    BorderBrush="Transparent" Background="Transparent" Padding="5">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="bd" Property="BorderBrush" Value="#FF4A6A90"/>
                <Setter TargetName="bd" Property="Background" Value="{StaticResource PillHover}"/>
              </Trigger>
              <Trigger Property="IsPressed" Value="True">
                <Setter TargetName="bd" Property="Background" Value="{StaticResource PillPressed}"/>
              </Trigger>
              <Trigger Property="IsEnabled" Value="False">
                <Setter TargetName="bd" Property="Opacity" Value="0.3"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style x:Key="OverlayBtn" TargetType="Button">
      <Setter Property="Foreground" Value="White"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="bd" Background="#55000000" BorderBrush="#55FFFFFF"
                    BorderThickness="1" CornerRadius="4" Padding="12,6">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="bd" Property="Background" Value="#88000000"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

  </Window.Resources>

  <Grid>
    <DockPanel x:Name="MainView">

      <Grid DockPanel.Dock="Bottom" Height="65">
        <Border>
          <Border.Background>
            <LinearGradientBrush StartPoint="0,0" EndPoint="0,1">
              <GradientStop Color="#FF1E2A3A" Offset="0"/>
              <GradientStop Color="#FF111820" Offset="1"/>
            </LinearGradientBrush>
          </Border.Background>
        </Border>
        <Border Height="1" VerticalAlignment="Top" Background="#FF3A5070"/>
        <Border Height="18" VerticalAlignment="Top" Margin="0,1,0,0">
          <Border.Background>
            <LinearGradientBrush StartPoint="0,0" EndPoint="0,1">
              <GradientStop Color="#22FFFFFF" Offset="0"/>
              <GradientStop Color="#00FFFFFF" Offset="1"/>
            </LinearGradientBrush>
          </Border.Background>
        </Border>

        <TextBlock x:Name="FileCountLabel" Text="" Foreground="#FF7A8EA8"
                   FontFamily="Segoe UI" FontSize="10"
                   HorizontalAlignment="Left" VerticalAlignment="Bottom" Margin="10,0,0,3"/>
        <TextBlock x:Name="FileInfoLabel" Text="" Foreground="#FF7A8EA8"
                   FontFamily="Segoe UI" FontSize="10"
                   HorizontalAlignment="Right" VerticalAlignment="Bottom" Margin="0,0,10,3"/>

        <Grid VerticalAlignment="Center">
          <Grid.ColumnDefinitions>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="*"/>
          </Grid.ColumnDefinitions>

          <StackPanel Grid.Column="0" Orientation="Horizontal"
                      HorizontalAlignment="Right" VerticalAlignment="Center" Margin="0,0,28,0">
            <Button x:Name="ZoomOutBtn" Style="{StaticResource ToolBtn}" ToolTip="Zoom out (-)">
              <Canvas Width="20" Height="20">
                <Ellipse Width="13" Height="13" Stroke="#FFAACCEE" StrokeThickness="1.8"
                         Canvas.Left="0" Canvas.Top="0"/>
                <Line X1="3.5" Y1="6.5" X2="9.5" Y2="6.5"
                      Stroke="#FFAACCEE" StrokeThickness="1.8"
                      StrokeStartLineCap="Round" StrokeEndLineCap="Round"/>
                <Line X1="10" Y1="10" X2="18" Y2="18"
                      Stroke="#FFAACCEE" StrokeThickness="2"
                      StrokeStartLineCap="Round" StrokeEndLineCap="Round"/>
              </Canvas>
            </Button>
            <Button x:Name="FitBtn" Style="{StaticResource ToolBtn}" ToolTip="Best fit (F)" Margin="2,0">
              <Canvas Width="20" Height="20">
                <Path Fill="#FFAACCEE" Data="M 0,0 L 5,0 L 0,5 Z"/>
                <Path Fill="#FFAACCEE" Data="M 15,0 L 20,0 L 20,5 Z"/>
                <Path Fill="#FFAACCEE" Data="M 0,15 L 0,20 L 5,20 Z"/>
                <Path Fill="#FFAACCEE" Data="M 20,15 L 20,20 L 15,20 Z"/>
              </Canvas>
            </Button>
            <Button x:Name="ZoomInBtn" Style="{StaticResource ToolBtn}" ToolTip="Zoom in (+)">
              <Canvas Width="20" Height="20">
                <Ellipse Width="13" Height="13" Stroke="#FFAACCEE" StrokeThickness="1.8"
                         Canvas.Left="0" Canvas.Top="0"/>
                <Line X1="3.5" Y1="6.5" X2="9.5" Y2="6.5"
                      Stroke="#FFAACCEE" StrokeThickness="1.8"
                      StrokeStartLineCap="Round" StrokeEndLineCap="Round"/>
                <Line X1="6.5" Y1="3.5" X2="6.5" Y2="9.5"
                      Stroke="#FFAACCEE" StrokeThickness="1.8"
                      StrokeStartLineCap="Round" StrokeEndLineCap="Round"/>
                <Line X1="10" Y1="10" X2="18" Y2="18"
                      Stroke="#FFAACCEE" StrokeThickness="2"
                      StrokeStartLineCap="Round" StrokeEndLineCap="Round"/>
              </Canvas>
            </Button>
          </StackPanel>

          <StackPanel Grid.Column="1" Orientation="Horizontal"
                      HorizontalAlignment="Center" VerticalAlignment="Center">
            <Button x:Name="PrevBtn" Style="{StaticResource NavPillBtn}"
                    ToolTip="Previous" Margin="0,0,6,0">
              <Canvas Width="18" Height="16">
                <Rectangle Width="2.8" Height="14" Fill="#FFCCDDED"
                           Canvas.Left="1" Canvas.Top="1" RadiusX="1" RadiusY="1"/>
                <Path Fill="#FFCCDDED" Data="M 17,1 L 6,8 L 17,15 Z"/>
              </Canvas>
            </Button>
            <Button x:Name="FSBtn" Style="{StaticResource OrbBtn}"
                    ToolTip="Play slideshow (F11)" Margin="0,0,6,0"/>
            <Button x:Name="NextBtn" Style="{StaticResource NavPillBtn}"
                    ToolTip="Next">
              <Canvas Width="18" Height="16">
                <Path Fill="#FFCCDDED" Data="M 1,1 L 12,8 L 1,15 Z"/>
                <Rectangle Width="2.8" Height="14" Fill="#FFCCDDED"
                           Canvas.Left="14.2" Canvas.Top="1" RadiusX="1" RadiusY="1"/>
              </Canvas>
            </Button>
          </StackPanel>

          <StackPanel Grid.Column="2" Orientation="Horizontal"
                      HorizontalAlignment="Left" VerticalAlignment="Center" Margin="28,0,0,0">
            <Button x:Name="DeleteBtn" Style="{StaticResource ToolBtn}" ToolTip="Delete (Del)">
              <Canvas Width="20" Height="22">
                <Rectangle Width="14" Height="2"   Fill="#FFDD6666"
                           Canvas.Left="3"   Canvas.Top="2"   RadiusX="1"   RadiusY="1"/>
                <Rectangle Width="6"  Height="1.5" Fill="#FFDD6666"
                           Canvas.Left="7"   Canvas.Top="0.5" RadiusX="1"   RadiusY="1"/>
                <Rectangle Width="12" Height="13"  Canvas.Left="4" Canvas.Top="5"
                           RadiusX="1.5" RadiusY="1.5" Fill="Transparent"
                           Stroke="#FFDD6666" StrokeThickness="1.5"/>
                <Line X1="8"  Y1="7.5" X2="8"  Y2="16" Stroke="#FFDD6666" StrokeThickness="1.2"/>
                <Line X1="12" Y1="7.5" X2="12" Y2="16" Stroke="#FFDD6666" StrokeThickness="1.2"/>
              </Canvas>
            </Button>
          </StackPanel>

        </Grid>
      </Grid>

      <Grid x:Name="ImageContainer" Background="#FF0C1018" ClipToBounds="True">

        <ScrollViewer x:Name="Viewer"
                      HorizontalScrollBarVisibility="Auto"
                      VerticalScrollBarVisibility="Auto"
                      Background="Transparent" Padding="0">
          <Grid x:Name="ImageWrapper" Background="Transparent">
            <Image x:Name="MainImage" Stretch="None"
                   HorizontalAlignment="Center" VerticalAlignment="Center"
                   RenderOptions.BitmapScalingMode="HighQuality">
              <Image.LayoutTransform>
                <ScaleTransform x:Name="ImageScale" ScaleX="1" ScaleY="1"/>
              </Image.LayoutTransform>
            </Image>
          </Grid>
        </ScrollViewer>

        <Border IsHitTestVisible="False">
          <Border.Background>
            <RadialGradientBrush GradientOrigin="0.5,0.5" Center="0.5,0.5"
                                 RadiusX="0.9" RadiusY="0.9">
              <GradientStop Color="#00000000" Offset="0.55"/>
              <GradientStop Color="#28000000" Offset="1"/>
            </RadialGradientBrush>
          </Border.Background>
        </Border>

        <StackPanel x:Name="PlaceholderPanel"
                    HorizontalAlignment="Center" VerticalAlignment="Center"
                    Visibility="Visible">
          <Border Width="96" Height="76" CornerRadius="6" Margin="0,0,0,16"
                  BorderBrush="#FF3A5070" BorderThickness="1">
            <Border.Background>
              <LinearGradientBrush StartPoint="0,0" EndPoint="0,1">
                <GradientStop Color="#FF1E2E44" Offset="0"/>
                <GradientStop Color="#FF111820" Offset="1"/>
              </LinearGradientBrush>
            </Border.Background>
            <Canvas Width="56" Height="44"
                    HorizontalAlignment="Center" VerticalAlignment="Center">
              <Rectangle Width="56" Height="44" Stroke="#FF3A6090" StrokeThickness="1.5"
                         RadiusX="3" RadiusY="3" Fill="#FF0C1820"/>
              <Ellipse Width="10" Height="10" Fill="#FF4488AA"
                       Canvas.Left="6" Canvas.Top="5"/>
              <Path Fill="#FF2A5A40"
                    Data="M 0,40 L 18,24 L 32,34 L 44,18 L 56,40 Z"/>
            </Canvas>
          </Border>
          <TextBlock Text="No image selected"
                     Foreground="#FF8AA8CC" FontFamily="Segoe UI" FontSize="18"
                     FontWeight="Light" TextAlignment="Center" Margin="0,0,0,6"/>
          <TextBlock Text="Press Ctrl+O or right-click to open an image"
                     Foreground="#FF4A6080" FontFamily="Segoe UI" FontSize="11"
                     TextAlignment="Center" Margin="0,0,0,20"/>
          <Button x:Name="PlaceholderOpenBtn" Style="{StaticResource OverlayBtn}"
                  Content="Open Image..." HorizontalAlignment="Center"
                  Foreground="#FFCCDDED" FontFamily="Segoe UI" FontSize="12"/>
        </StackPanel>

        <Grid.ContextMenu>
          <ContextMenu Background="#FF1A2434" BorderBrush="#FF3A5070">
            <MenuItem x:Name="MenuOpen"     Header="Open…    Ctrl+O"    Foreground="#FFD0E4F8"/>
            <Separator/>
            <MenuItem x:Name="MenuFit"      Header="Best Fit"           Foreground="#FFD0E4F8"/>
            <MenuItem x:Name="MenuActual"   Header="Actual Size (100%)" Foreground="#FFD0E4F8"/>
            <Separator/>
            <MenuItem x:Name="MenuCopyLogs" Header="Copy Debug Logs"    Foreground="#FFD0E4F8"/>
          </ContextMenu>
        </Grid.ContextMenu>

      </Grid>
    </DockPanel>

    <Border x:Name="FullScreenOverlay" Visibility="Collapsed"
            Background="Black" Focusable="True" Panel.ZIndex="200">
      <Grid>
        <Image x:Name="FSImage" Stretch="Uniform"
               HorizontalAlignment="Center" VerticalAlignment="Center"
               RenderOptions.BitmapScalingMode="HighQuality"/>

        <Border HorizontalAlignment="Left" VerticalAlignment="Center"
                Background="#55000000" CornerRadius="0,4,4,0" Padding="4,18">
          <Button x:Name="FSPrevBtn" Background="Transparent" BorderThickness="0"
                  Cursor="Hand" Width="30" Height="44">
            <Path Fill="#CCFFFFFF" Data="M 16,4 L 4,18 L 16,32 Z"/>
          </Button>
        </Border>

        <Border HorizontalAlignment="Right" VerticalAlignment="Center"
                Background="#55000000" CornerRadius="4,0,0,4" Padding="4,18">
          <Button x:Name="FSNextBtn" Background="Transparent" BorderThickness="0"
                  Cursor="Hand" Width="30" Height="44">
            <Path Fill="#CCFFFFFF" Data="M 4,4 L 16,18 L 4,32 Z"/>
          </Button>
        </Border>

        <Border VerticalAlignment="Bottom" HorizontalAlignment="Center" Margin="0,0,0,24"
                Background="#88000000" CornerRadius="6" Padding="16,7">
          <StackPanel Orientation="Horizontal">
            <Button x:Name="FSPauseBtn" Background="Transparent" BorderThickness="0"
                    Cursor="Hand" Width="38" Height="34" Margin="0,0,6,0">
              <Canvas Width="20" Height="20">
                <Rectangle Width="5" Height="16" Fill="#CCFFFFFF" Canvas.Left="2"  Canvas.Top="2"/>
                <Rectangle Width="5" Height="16" Fill="#CCFFFFFF" Canvas.Left="13" Canvas.Top="2"/>
              </Canvas>
            </Button>
            <Button x:Name="FSExitBtn" Background="Transparent" BorderThickness="0"
                    Cursor="Hand" Width="38" Height="34">
              <Path Stroke="#CCFFFFFF" StrokeThickness="2.5"
                    StrokeStartLineCap="Round" StrokeEndLineCap="Round"
                    Data="M 4,4 L 16,16 M 16,4 L 4,16"/>
            </Button>
          </StackPanel>
        </Border>

        <TextBlock x:Name="FSCountLabel" Text="" Foreground="#88FFFFFF"
                   FontFamily="Segoe UI" FontSize="13"
                   HorizontalAlignment="Right" VerticalAlignment="Top" Margin="0,12,18,0"/>
      </Grid>
    </Border>

  </Grid>
</Window>
"@

# ──────────────────────────────────────────────
#  Load XAML
# ──────────────────────────────────────────────
try {
    $reader = [System.Xml.XmlReader]::Create(
                  [System.IO.StringReader]::new($xamlString))
    $window = [System.Windows.Markup.XamlReader]::Load($reader)
} catch {
    Write-Host "XAML FAILED: $($_.Exception.Message)" -ForegroundColor Red
    exit
}

# ──────────────────────────────────────────────
#  Named-element handles
# ──────────────────────────────────────────────
$MainImage          = $window.FindName("MainImage")
$FSImage            = $window.FindName("FSImage")
$Overlay            = $window.FindName("FullScreenOverlay")
$Viewer             = $window.FindName("Viewer")
$ImageScale         = $window.FindName("ImageScale")
$PlaceholderPanel   = $window.FindName("PlaceholderPanel")
$PlaceholderOpenBtn = $window.FindName("PlaceholderOpenBtn")
$FileInfoLabel      = $window.FindName("FileInfoLabel")
$FileCountLabel     = $window.FindName("FileCountLabel")
$FSCountLabel       = $window.FindName("FSCountLabel")

$ZoomInBtn  = $window.FindName("ZoomInBtn")
$ZoomOutBtn = $window.FindName("ZoomOutBtn")
$FitBtn     = $window.FindName("FitBtn")
$FSBtn      = $window.FindName("FSBtn")
$NextBtn    = $window.FindName("NextBtn")
$PrevBtn    = $window.FindName("PrevBtn")
$FSNextBtn  = $window.FindName("FSNextBtn")
$FSPrevBtn  = $window.FindName("FSPrevBtn")
$FSPauseBtn = $window.FindName("FSPauseBtn")
$FSExitBtn  = $window.FindName("FSExitBtn")
$DeleteBtn  = $window.FindName("DeleteBtn")

$MenuOpen     = $window.FindName("MenuOpen")
$MenuFit      = $window.FindName("MenuFit")
$MenuActual   = $window.FindName("MenuActual")
$MenuCopyLogs = $window.FindName("MenuCopyLogs")

# ──────────────────────────────────────────────
#  State
# ──────────────────────────────────────────────
$script:images           = New-Object System.Collections.Generic.List[string]
$script:currentIndex     = 0
$script:currentZoom      = 1.0
$script:fitZoom          = 1.0
$script:slideshowTimer   = $null
$script:slideshowRunning = $false
$script:isDragging       = $false
$script:dragStartPos     = $null
$script:dragStartHOffset = 0
$script:dragStartVOffset = 0

# ──────────────────────────────────────────────
#  Helpers
# ──────────────────────────────────────────────
function Format-FileSize([long]$b) {
    if ($b -ge 1MB) {
        "{0:N1} MB" -f ($b / 1MB)
    } elseif ($b -ge 1KB) {
        "{0:N0} KB" -f ($b / 1KB)
    } else {
        "$b bytes"
    }
}

function Get-FitZoom {
    if ($null -eq $MainImage.Source) { return 1.0 }
    $iw = $MainImage.Source.PixelWidth
    $ih = $MainImage.Source.PixelHeight
    $vw = $Viewer.ActualWidth  - 16
    $vh = $Viewer.ActualHeight - 16
    if ($vw -le 0 -or $vh -le 0 -or $iw -le 0 -or $ih -le 0) { return 1.0 }
    $s = [Math]::Min($vw / $iw, $vh / $ih)
    if ($s -gt 1.0) { $s = 1.0 }
    return $s
}

function Apply-Zoom([double]$z) {
    if ($z -lt 0.04) { $z = 0.04 }
    if ($z -gt 12.0) { $z = 12.0 }
    $script:currentZoom = $z
    $ImageScale.ScaleX  = $z
    $ImageScale.ScaleY  = $z
}

function Fit-ToWindow {
    $script:fitZoom = Get-FitZoom
    Apply-Zoom $script:fitZoom
}

# ──────────────────────────────────────────────
#  Synchronous image loader (no threading issues)
# ──────────────────────────────────────────────
function Load-Image([string]$path) {
    try {
        $bytes  = [System.IO.File]::ReadAllBytes($path)
        $stream = New-Object System.IO.MemoryStream(, $bytes)

        $bmp = New-Object System.Windows.Media.Imaging.BitmapImage
        $bmp.BeginInit()
        $bmp.CacheOption  = [System.Windows.Media.Imaging.BitmapCacheOption]::OnLoad
        $bmp.StreamSource = $stream
        $bmp.EndInit()
        $bmp.Freeze()
        $stream.Dispose()

        return $bmp
    } catch {
        Add-Log "Load error for ${path}: $_"
        return $null
    }
}

function Update-Image {
    if ($script:images.Count -eq 0) {
        $PlaceholderPanel.Visibility = 'Visible'
        $MainImage.Source            = $null
        $FSImage.Source              = $null
        $FileInfoLabel.Text         = ""
        $FileCountLabel.Text        = ""
        $window.Title               = "Windows Photo Viewer"
        return
    }

    $PlaceholderPanel.Visibility = 'Collapsed'
    $path = $script:images[$script:currentIndex]

    Add-Log "Loading [$($script:currentIndex)]: $path"

    $bmp = Load-Image $path

    if ($null -eq $bmp) {
        Add-Log "Failed to load: $path"
        $MainImage.Source    = $null
        $FSImage.Source      = $null
        $FileInfoLabel.Text  = "Error loading file"
        $FileCountLabel.Text = "$($script:currentIndex + 1) of $($script:images.Count)"
        $window.Title        = "Windows Photo Viewer"
        return
    }

    $MainImage.Source = $bmp
    $FSImage.Source   = $bmp

    # Let layout settle, then fit
    $window.Dispatcher.BeginInvoke(
        [System.Windows.Threading.DispatcherPriority]::Loaded,
        [System.Action]{
            Fit-ToWindow
        }
    ) | Out-Null

    $fi   = [System.IO.FileInfo]::new($path)
    $dims = "$($bmp.PixelWidth) x $($bmp.PixelHeight)"
    $sz   = Format-FileSize $fi.Length

    $FileInfoLabel.Text  = "$dims  |  $sz"
    $FileCountLabel.Text = "$($script:currentIndex + 1) of $($script:images.Count)"
    $FSCountLabel.Text   = "$($script:currentIndex + 1) / $($script:images.Count)"
    $window.Title        = "$($fi.Name) - Windows Photo Viewer"
}

# ──────────────────────────────────────────────
#  Open file dialog
# ──────────────────────────────────────────────
function Open-Images {
    $fd = New-Object Microsoft.Win32.OpenFileDialog
    $fd.Multiselect = $true
    $fd.Filter      = "Images|*.jpg;*.jpeg;*.png;*.bmp;*.gif;*.tiff;*.tif;*.ico|All Files|*.*"
    $fd.Title       = "Open Image"
    if ($fd.ShowDialog() -ne $true) { return }

    $script:images.Clear()
    $exts = @("*.jpg","*.jpeg","*.png","*.bmp","*.gif","*.tiff","*.tif")

    if ($fd.FileNames.Count -eq 1) {
        $dir = [System.IO.Path]::GetDirectoryName($fd.FileNames[0])
        $all = @()
        foreach ($x in $exts) {
            $all += [System.IO.Directory]::GetFiles($dir, $x)
        }
        $all = $all | Sort-Object -Unique
        foreach ($f in $all) { $script:images.Add($f) }
        $script:currentIndex = 0
        for ($i = 0; $i -lt $script:images.Count; $i++) {
            if ($script:images[$i] -eq $fd.FileNames[0]) {
                $script:currentIndex = $i
                break
            }
        }
    } else {
        foreach ($f in ($fd.FileNames | Sort-Object)) {
            $script:images.Add($f)
        }
        $script:currentIndex = 0
    }

    Add-Log "Opened $($script:images.Count) files."
    Update-Image
}

# ──────────────────────────────────────────────
#  Navigation
# ──────────────────────────────────────────────
function Step-Next {
    if ($script:images.Count -eq 0) { return }
    $script:currentIndex = ($script:currentIndex + 1) % $script:images.Count
    Update-Image
}

function Step-Prev {
    if ($script:images.Count -eq 0) { return }
    $script:currentIndex = ($script:currentIndex - 1 + $script:images.Count) % $script:images.Count
    Update-Image
}

# ──────────────────────────────────────────────
#  Button wiring
# ──────────────────────────────────────────────
$PlaceholderOpenBtn.Add_Click({ Open-Images })
$NextBtn.Add_Click({ Step-Next })
$PrevBtn.Add_Click({ Step-Prev })
$FSNextBtn.Add_Click({ Step-Next })
$FSPrevBtn.Add_Click({ Step-Prev })

$MenuOpen.Add_Click({ Open-Images })
$MenuFit.Add_Click({
    if ($null -ne $MainImage.Source) { Fit-ToWindow }
})
$MenuActual.Add_Click({
    if ($null -ne $MainImage.Source) { Apply-Zoom 1.0 }
})
$MenuCopyLogs.Add_Click({
    [System.Windows.Clipboard]::SetText($script:debugLogs -join "`r`n")
    [System.Windows.MessageBox]::Show(
        "$($script:debugLogs.Count) entries copied.",
        "Photo Viewer", 'OK', 'Information')
})

$script:zoomLevels = @(0.10, 0.25, 0.33, 0.50, 0.67, 0.75, 1.0, 1.25, 1.5, 2.0, 3.0, 4.0, 6.0, 8.0)

$ZoomInBtn.Add_Click({
    if ($null -eq $MainImage.Source) { return }
    $cur  = $script:currentZoom
    $next = $script:zoomLevels | Where-Object { $_ -gt ($cur + 0.005) } | Select-Object -First 1
    if ($null -eq $next) { $next = $script:zoomLevels[-1] }
    Apply-Zoom $next
})

$ZoomOutBtn.Add_Click({
    if ($null -eq $MainImage.Source) { return }
    $cur  = $script:currentZoom
    $prev = $script:zoomLevels | Where-Object { $_ -lt ($cur - 0.005) } | Select-Object -Last 1
    if ($null -eq $prev) { $prev = $script:zoomLevels[0] }
    Apply-Zoom $prev
})

$FitBtn.Add_Click({
    if ($null -ne $MainImage.Source) { Fit-ToWindow }
})

$DeleteBtn.Add_Click({
    if ($script:images.Count -eq 0) { return }
    $path = $script:images[$script:currentIndex]
    $name = [System.IO.Path]::GetFileName($path)
    $r = [System.Windows.MessageBox]::Show(
        "Move '$name' to the Recycle Bin?",
        "Windows Photo Viewer",
        [System.Windows.MessageBoxButton]::YesNo,
        [System.Windows.MessageBoxImage]::Question)
    if ($r -eq 'Yes') {
        try {
            Add-Type -AssemblyName Microsoft.VisualBasic
            [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
                $path, 'OnlyErrorDialogs', 'SendToRecycleBin')
            $script:images.RemoveAt($script:currentIndex)
            if ($script:currentIndex -ge $script:images.Count) {
                $script:currentIndex = 0
            }
            Update-Image
        } catch {
            [System.Windows.MessageBox]::Show(
                "Could not delete.`n$_", "Error", 'OK', 'Error')
        }
    }
})

# ──────────────────────────────────────────────
#  Fullscreen / slideshow
# ──────────────────────────────────────────────
function Enter-Fullscreen {
    if ($script:images.Count -eq 0) { return }
    $Overlay.Visibility      = 'Visible'
    $Overlay.Focus()         | Out-Null
    $window.WindowStyle      = 'None'
    $window.WindowState      = 'Maximized'
    $script:slideshowRunning = $true
    if ($null -eq $script:slideshowTimer) {
        $script:slideshowTimer = New-Object System.Windows.Threading.DispatcherTimer
        $script:slideshowTimer.Interval = [TimeSpan]::FromSeconds(5)
        $script:slideshowTimer.Add_Tick({
            if ($script:slideshowRunning) { Step-Next }
        })
    }
    $script:slideshowTimer.Start()
}

function Exit-Fullscreen {
    $Overlay.Visibility = 'Collapsed'
    $window.WindowStyle = 'SingleBorderWindow'
    $window.WindowState = 'Normal'
    if ($null -ne $script:slideshowTimer) {
        $script:slideshowTimer.Stop()
    }
    $script:slideshowRunning = $false
}

$FSBtn.Add_Click({ Enter-Fullscreen })
$FSExitBtn.Add_Click({ Exit-Fullscreen })

$FSPauseBtn.Add_Click({
    $script:slideshowRunning = -not $script:slideshowRunning
    if ($script:slideshowRunning) {
        $script:slideshowTimer.Start()
    } else {
        $script:slideshowTimer.Stop()
    }
})

# ──────────────────────────────────────────────
#  Mouse: wheel zoom, drag pan, double-click FS
# ──────────────────────────────────────────────
$Viewer.Add_PreviewMouseWheel({
    param($s, $e)
    if ($null -eq $MainImage.Source) { return }
    $f = if ($e.Delta -gt 0) { 1.15 } else { 1 / 1.15 }
    Apply-Zoom ($script:currentZoom * $f)
    $e.Handled = $true
})

$Viewer.Add_PreviewMouseLeftButtonDown({
    param($s, $e)
    if ($null -eq $MainImage.Source) { return }
    if ($e.ClickCount -eq 2) {
        if ($Overlay.Visibility -eq 'Visible') {
            Exit-Fullscreen
        } else {
            Enter-Fullscreen
        }
        return
    }
    $script:isDragging       = $true
    $script:dragStartPos     = $e.GetPosition($Viewer)
    $script:dragStartHOffset = $Viewer.HorizontalOffset
    $script:dragStartVOffset = $Viewer.VerticalOffset
    $Viewer.Cursor           = [System.Windows.Input.Cursors]::ScrollAll
    $Viewer.CaptureMouse()   | Out-Null
    $e.Handled               = $true
})

$Viewer.Add_PreviewMouseMove({
    param($s, $e)
    if (-not $script:isDragging) { return }
    $p = $e.GetPosition($Viewer)
    $Viewer.ScrollToHorizontalOffset(
        $script:dragStartHOffset + ($script:dragStartPos.X - $p.X))
    $Viewer.ScrollToVerticalOffset(
        $script:dragStartVOffset + ($script:dragStartPos.Y - $p.Y))
})

$Viewer.Add_PreviewMouseLeftButtonUp({
    param($s, $e)
    if ($script:isDragging) {
        $script:isDragging = $false
        $Viewer.ReleaseMouseCapture()
        $Viewer.Cursor = [System.Windows.Input.Cursors]::Arrow
    }
})

# ──────────────────────────────────────────────
#  Window resize: re-fit when in fit mode
# ──────────────────────────────────────────────
$window.Add_SizeChanged({
    if ($null -ne $MainImage.Source -and
        [Math]::Abs($script:currentZoom - $script:fitZoom) -lt 0.002) {
        $script:fitZoom = Get-FitZoom
        Apply-Zoom $script:fitZoom
    }
})

# ──────────────────────────────────────────────
#  Keyboard
# ──────────────────────────────────────────────
$window.Add_KeyDown({
    param($s, $e)
    switch ($e.Key) {
        'Escape' {
            if ($Overlay.Visibility -eq 'Visible') { Exit-Fullscreen }
        }
        'Right' {
            Step-Next
            $e.Handled = $true
        }
        'Left' {
            Step-Prev
            $e.Handled = $true
        }
        'F11' {
            if ($Overlay.Visibility -eq 'Visible') {
                Exit-Fullscreen
            } else {
                Enter-Fullscreen
            }
        }
        'Delete' {
            $DeleteBtn.RaiseEvent(
                [System.Windows.RoutedEventArgs]::new(
                    [System.Windows.Controls.Primitives.ButtonBase]::ClickEvent))
        }
        'F' {
            if ($null -ne $MainImage.Source) { Fit-ToWindow }
        }
        'Add' {
            if ($null -ne $MainImage.Source) {
                $ZoomInBtn.RaiseEvent(
                    [System.Windows.RoutedEventArgs]::new(
                        [System.Windows.Controls.Primitives.ButtonBase]::ClickEvent))
            }
        }
        'Subtract' {
            if ($null -ne $MainImage.Source) {
                $ZoomOutBtn.RaiseEvent(
                    [System.Windows.RoutedEventArgs]::new(
                        [System.Windows.Controls.Primitives.ButtonBase]::ClickEvent))
            }
        }
    }
    if ($e.Key -eq 'O' -and
        ([System.Windows.Input.Keyboard]::Modifiers -band
         [System.Windows.Input.ModifierKeys]::Control)) {
        Open-Images
        $e.Handled = $true
    }
})

# ──────────────────────────────────────────────
#  Drag and drop
# ──────────────────────────────────────────────
$window.AllowDrop = $true

$window.Add_DragOver({
    param($s, $e)
    $e.Effects = [System.Windows.DragDropEffects]::Copy
    $e.Handled = $true
})

$window.Add_Drop({
    param($s, $e)
    if (-not $e.Data.GetDataPresent([System.Windows.DataFormats]::FileDrop)) { return }
    $files   = $e.Data.GetData([System.Windows.DataFormats]::FileDrop)
    $imgExts = @('.jpg','.jpeg','.png','.bmp','.gif','.tiff','.tif','.ico')
    $script:images.Clear()

    if ($files.Count -eq 1 -and [System.IO.Directory]::Exists($files[0])) {
        foreach ($x in @("*.jpg","*.jpeg","*.png","*.bmp","*.gif","*.tiff","*.tif")) {
            foreach ($f in [System.IO.Directory]::GetFiles($files[0], $x)) {
                $script:images.Add($f)
            }
        }
    } else {
        foreach ($f in $files) {
            if ($imgExts -contains [System.IO.Path]::GetExtension($f).ToLower()) {
                $script:images.Add($f)
            }
        }
    }

    if ($script:images.Count -gt 0) {
        $sorted = $script:images | Sort-Object -Unique
        $script:images.Clear()
        foreach ($f in $sorted) { $script:images.Add($f) }
        $script:currentIndex = 0
        Update-Image
    }
})

# ──────────────────────────────────────────────
#  Command-line argument
# ──────────────────────────────────────────────
$cmdArgs = [System.Environment]::GetCommandLineArgs()
if ($cmdArgs.Count -gt 1) {
    $argPath = $cmdArgs[-1]
    if ([System.IO.File]::Exists($argPath)) {
        $dir = [System.IO.Path]::GetDirectoryName($argPath)
        foreach ($x in @("*.jpg","*.jpeg","*.png","*.bmp","*.gif","*.tiff","*.tif")) {
            foreach ($f in [System.IO.Directory]::GetFiles($dir, $x)) {
                $script:images.Add($f)
            }
        }
        $sorted = $script:images | Sort-Object -Unique
        $script:images.Clear()
        foreach ($f in $sorted) { $script:images.Add($f) }
        for ($i = 0; $i -lt $script:images.Count; $i++) {
            if ($script:images[$i] -eq $argPath) {
                $script:currentIndex = $i
                break
            }
        }
        Update-Image
    }
}

Add-Log "Ready."
$window.ShowDialog() | Out-Null
